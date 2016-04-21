From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2016 17:28:03 -0300
Subject: [Buildroot] [PATCH 2/2] mpv: new package
In-Reply-To: <57193267.7050706@mind.be>
References: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
 <1461246857-5634-2-git-send-email-gustavo@zacarias.com.ar>
 <57193267.7050706@mind.be>
Message-ID: <571937D3.7030907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/16 17:04, Arnout Vandecappelle wrote:

>      depends on !BR2_nios2 # ffmpeg

Ah yes, i'll update.

>   Weird that an uploaded tarball doesn't include waf...
>
>   It may make sense to create a host-waf package that does downloads the
> prebuilt self-extractor. This would allow us to remove the dependency on
> host-python for all the packages that use waf, because current waf
> supports python 2.5-3.5, which is plenty for us I think.
>
>
>   Otherwise looks good to me.

They provide a bootstrap script that downloads it, but i consider it 
better that we handle that on our own/infra for obvious reasons.
Regarding host-waf it's not really a good idea, essentially you've got 
several major waf versions say 1.6.x, 1.8.x and soon 1.9.x which aren't 
too drop-in compatible.
Even the mpv authors frowned upon upgrading the 1.8.12 preferred version 
with the latest 1.8.x (1.8.20) in their tracker (not from me, rather 
when looking about open issues/improvements).
And then there's samba which has an extended waf (wafsamba) and are 
stuck on the 1.6.x series because of that.
Regards.
