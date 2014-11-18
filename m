From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 16:59:50 -0300
Subject: [Buildroot] [PATCH 3/9] ifupdown: new package
In-Reply-To: <546BA480.7050807@mind.be>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>
 <546BA480.7050807@mind.be>
Message-ID: <546BA536.4020508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2014 04:56 PM, Arnout Vandecappelle wrote:

>  The bundled install tries to symlink ifdown->ifup, without removing ifup first.
> So when it's installed a second time, or when busybox is selected, it errors out.
> 
>  Adding an $(RM) $(TARGET_DIR)/sbin/ifdown solves it.

Aha! That's the reason i used a manual install before :)
Just found it again when testing without dpkg-architecture (and your mail).
I'll amend for v4.
Regards.
