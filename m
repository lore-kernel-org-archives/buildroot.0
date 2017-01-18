From: scsijon <scsijon@lamiaworks.com.au>
Date: Wed, 18 Jan 2017 20:40:17 +1100
Subject: [Buildroot] make menuconfig problem in latest snapshot
In-Reply-To: <20170118175332.60e7a690@free-electrons.com>
References: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
 <20170118175332.60e7a690@free-electrons.com>
Message-ID: <56f73092-ec12-e0a4-d633-bee57e834628@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sorry folks, i'm just starting to play with buildroot. It was just that 
there was a snapshot that I d/l and tried to run that found the problem 
so i'm not up to the stage of an actual build (running make) yet. I'm 
just working my way through the manual and docs.

regards
scsijon

On 01/18/2017 05:53 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 18 Jan 2017 12:55:49 +1100, scsijon wrote:
>> Found this error in todays snapshot
>> --------------------------
>> # make menuconfig
>> support/scripts/br2-external: line 111: syntax error near unexpected
>> token `"${br2_name}"'
>> Makefile:197:
>> /initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk:
>> No such file or directory
>> make: Failed to remake makefile
>> `/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk'.
>> support/scripts/br2-external: line 111: syntax error near unexpected
>> token `"${br2_name}"'
>> make: ***
>> [/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/build/.br2-external.in]
>> Error 2
>> #
>> ----------------------------
>
> Thanks for the report! Can you try reverting commit
> 05576fca13b129da8c7186ee2307981135d3391f ? I believe it's the one that
> introduced the problem.
>
> Yann, are you sure that the nested double quotes are OK?
>
> Thanks,
>
> Thomas
>
