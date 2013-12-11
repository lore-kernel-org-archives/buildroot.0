From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Dec 2013 07:35:20 +0200
Subject: [Buildroot] Knowing whether the target is multicore
In-Reply-To: <CA+-urNRh5WARfiTZXAiULdXmxTErbdJSGWTnRHjiTr_uEyEoeA@mail.gmail.com>
References: <CA+-urNRh5WARfiTZXAiULdXmxTErbdJSGWTnRHjiTr_uEyEoeA@mail.gmail.com>
Message-ID: <20131211053520.GD1217@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Tue, Dec 10, 2013 at 04:55:37PM -0500, Frank Hunleth wrote:
> From what I can tell, the answer is no, but I was wondering if there
> was any way of knowing in a package's .mk file whether the target is
> single or multicore.
> 
> The reason that I'm asking is that I'm currently working with the
> Erlang package. The Erlang configure script can be told whether to
> build a VM that supports multi-core or not. By default, it builds VMs
> for both cases. This works, but takes quite a bit longer to compile
> and adds to the target image size. I'd like to be able to set this
> appropriately, and it seems like this would be better accomplished
> using an arch-specific BR2_ variable rather than something in the
> Erlang package's Config.in.

Whether a target is SMP or not depends on architecture and kernel 
configuration, and that might be outside of Buildroot control when not 
building the kernel internally. In my opinion, there should be a config option 
allowing the user to select the SMP version or the UP one (or both).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
