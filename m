From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 09:58:50 +0100
Subject: [Buildroot] [PATCH] graph-depends: add to exclusion list
In-Reply-To: <1357158963-3251-1-git-send-email-yann.morin.1998@free.fr>
References: <201301022128.33543.yann.morin.1998@free.fr>
 <1357158963-3251-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130103095850.4e96c47a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  2 Jan 2013 21:36:03 +0100, Yann E. MORIN wrote:
> Add the root-password internal target to the exclusion list.
> 
> Fixes failures like:
>     Getting dependencies for [... 'target-root-passwd' ...]
>     Error getting dependencies [... 'target-root-passwd' ...]
> 
> Which is easily singled out with:
>     $ make target-root-passwd-show-depends
>     make[1]: *** No rule to make target
> `target-root-passwd-show-depends'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, indeed. I was in the train, and my master was not fully
up-to-date with the latest root password related changes.

Ideally, the script should parse the make output a bit better and be
capable of showing the error, but well...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
