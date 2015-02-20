From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Feb 2015 19:50:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xfs: Fix linking
	error
References: <1424452969-6166-1-git-send-email-bernd.kuhls@t-online.de>
 <20150220193524.72d2ff63@free-electrons.com>
Message-ID: <XnsA447C9E5F2621berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150220193524.72d2ff63 at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Fri, 20 Feb 2015 18:22:49 +0100, Bernd Kuhls wrote:
>> Fixes
>> 
http://autobuild.buildroot.net/results/a0b/a0bd6312d450fb78db7f57d3db9e01ba2b
26687d//
>> 
http://autobuild.buildroot.net/results/534/5347293cdcd7eb2e84b762ee9d073f3b93
7b5312//
>> 
http://autobuild.buildroot.net/results/b5e/b5e7599ba33dc43a8f7e81bfa6d7ad9cb0
ac68a1//
>> 
>> and many others (microblazeel only)
> 
> Maybe this is a silly question, but do we know why this error is
> appearing on Microblaze only?

Hi,

during configure xapp_xfs (and xapp_bdftopcf as well...) does not check for 
dlopen so at the end "-ldl" is missing at linking stage. After digging around 
a bit in libtool stuff I stopped because I could not find out what was going 
on there...

Regards, Bernd
