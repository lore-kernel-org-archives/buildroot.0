From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 6 Jan 2016 22:00:32 +0100
Subject: [Buildroot] [PATCH 1/6] package/mesa3d: reorder select/depends
In-Reply-To: <87egdxhqv5.fsf@dell.be.48ers.dk>
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
 <87egdxhqv5.fsf@dell.be.48ers.dk>
Message-ID: <568D8070.90501@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 05/01/2016 00:22, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  >> From [1]:
>  > "Even though the ordering has absolutely no consequences in Kconfig, it
>  > is not logical (when reading). It is more logical and far easier to
>  > understand when depends come first, followed by the selects."
> 
>  > Also, the Config.in exemple in the manual suggest to use this coding
>  > style [2].
> 
>  > [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
>  > [2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Committed patch 1-5, thanks. I had already applied a similar patch from
> Gustavoz for xapp_xbacklight. That one didn't select libxcb though, but
> I guess it doesn't really matter as libX11 pulls it in.

No problem, I'll remove patch 6 from the patchwork.

> 
> (xcb-util should arguably select libxcb as it is a library instead of
> using depends on).
> 

Yes probably. Using "depends on" would help if libxcb would have several
dependencies (like for the efl package) but there is none.

Best regards,
Romain
