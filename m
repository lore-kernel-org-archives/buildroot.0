From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Fri, 11 Apr 2008 16:12:52 +1200
Subject: [Buildroot] locale displaying odd behaviour
Message-ID: <408540dd0804102112t62d946c5na94feaaeb6e7d1fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
So I have compiled buildroot for an arm target, specifically at91sam9263.
buildroot svn r21660, gcc 4.2.3, uClibc svn r21622
All seems to work well except for locales.

I wrote a bit of code to check what is returned by lconv() and get the
following result:

# /mnt/usb/locale-test
Locale (ALL) --> "C"
Locale (CTYPE) --> "C"
Locale (NUMERIC) --> "C"
Locale (MONETARY) --> "C"
Locale (TIME) --> "C"
Decimal point --> ""
Thousands seperator --> ""
Grouping --> ""
International currency symbol --> "."
Currency Symbol --> "?.?."
Monetary Decimal Point --> ""
Monetary Thousands Seperator --> " "
Monetary Grouping --> ""
Negative Sign --> ""
Positive Sign --> ""
#

The immediately obvious thing is the lack of the currency symbol but
there are more severe problems like the lack of a decimal point
character.
Similar output for all locales (en_US.UTF-8 etc.)

I have tried various configurations with no effect.

Anyone seen this before?
know how to fix it?
I suspect that uClibc is the problem but maybe someone has seen this before.

Thanks,
Matthew
