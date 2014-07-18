From: Rick Taylor <rick@tropicalstormsoftware.com>
Date: Fri, 18 Jul 2014 08:21:34 +0000
Subject: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to
 autotools package
In-Reply-To: <20140717204350.6cedbf85@free-electrons.com>
References: <38A5475DE83986499AEACD2CFAFC3F9801148D7154@tss-server1.home.tropicalstormsoftware.com>,
 <20140717204350.6cedbf85@free-electrons.com>
Message-ID: <38A5475DE83986499AEACD2CFAFC3F9801148D7428@tss-server1.home.tropicalstormsoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Unfortunately I am stuck on a machine with no outgoing SMTP server on the network.  I have the git patches, but I as I'm using a webmail client I have to work out exactly what is needed in the body of the email.

Do you want content of both patch files as plain text in the body of the email?  If so, what do you want the subject line to be?

I'll update the documentation text to be a little clearer, I just cut'n'pasted from the LIBFOO_MAKE_ENV text in the same file.

Sorry to be a pain,

Rick Taylor
________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: 17 July 2014 19:43
To: Rick Taylor
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to autotools package

Dear Rick Taylor,

On Thu, 17 Jul 2014 12:21:54 +0000, Rick Taylor wrote:

> I haven't aggressively tested it against buildroot master I'm afraid
> as we have a load of extra infrastructure around buildroot so we
> stick to full releases, and we are just evaluating 2014.05.
>
> I shall update the docs/manual/adding-packages-autotools.txt and
> resubmit the patches.

Thanks for the explanation. However, we have received this e-mail with
a "PATCH 1/1" title even though it doesn't contain a patch, and then
the documentation update as PATCH 2/2.

In a nutshell, assuming you have a branch named "autoreconf-env" with
two patches on top of the "master" branch, what you should do to send
your patches is:

        git format-patch master

Then review the 0001-<foo>.patch and 0002-<bar>.patch to make sure
everything is in order. And then:

        git send-email --to buildroot at uclibc.org *.patch

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
