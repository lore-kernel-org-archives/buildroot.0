From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:14:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <566DDC20.5000104@mind.be> (Arnout Vandecappelle's message of
 "Sun, 13 Dec 2015 21:59:12 +0100")
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <566DDC20.5000104@mind.be>
Message-ID: <87h9j0dhs7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

> On 13-12-15 10:16, Bernd Kuhls wrote:
>> To reproduce the build error I had to install libpcap0.8-dev on my host
>> system, then wireshark configure picks up
>> 
>> checking for pcap-config... /usr/bin/pcap-config

>  To fundamentally avoid this type of issue (we have a bunch of fixes like this),
> I think we should add an additional directory that is put in the _beginning_ of
> the path in TARGET_MAKE_ENV. This directory could then be populated through the
> _CONFIG_SCRIPTS mechanism.

>  What do the others think?

Sounds good to me!

>  It will be a bit of work to revert all these fixes again :-)

But that can be done iteratively. The point is that buildroot will do
the right thing for these scripts out of the box (as long as they are
listed in the packages providing them) and users of those scripts will
automatically get the right ones.

-- 
Bye, Peter Korsgaard
