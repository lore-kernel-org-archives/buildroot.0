From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Oct 2011 07:38:21 -0300
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_4/6=5D_qemu=5Fx86=3A_update_to_ker?=
 =?utf-8?q?nel_3=2E1_and_add_readme?=
In-Reply-To: <874nyxwehb.fsf@macbook.be.48ers.dk>
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
 <87aa8py4ai.fsf@macbook.be.48ers.dk>
 <a0295126a06f4884db6a02d03c460db8@zacarias.com.ar>
 <874nyxwehb.fsf@macbook.be.48ers.dk>
Message-ID: <566a402c56322b52981797d13ecf99ab@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.10.2011 07:30, Peter Korsgaard wrote:

>  Gustavo> Any particular reason for this on x86?
>  Gustavo> It would make things simpler to test graphics apps (X11) 
> keeping it
>  Gustavo> PC-like IMHO.
>
> Just to keep it closer to the other configs (E.G. the versatile
> config). What's the problem with running X11 from a getty on ttyS0?

On x86-land we've got two scenarios:
1) The usual PC-like hardware with VGA and for which modern 
implementations mostly lack serial ports (even if they have them they 
lack the connector/level converters thus not having them in practical 
terms).
2) The really-embedded x86 boards which completely lack video out and 
use serial as a console (soekris, pcengines and others).
If we intend for the qemu sample configs to work on real hardware we 
should choose one of the above scenarios.
I think we sholdn't limit ourselves to keep the configs as close as 
possible between themselves, rather as close as the hardware and use 
scenario.
I'm not against serial console for x86, just that many people would 
probably expect the resulting image to work on a standard non-serial 
bearing PC. After all qemu emulates a PC rather than a embedded-ish x86 
with GPIO and other embedded features.
Regards.
