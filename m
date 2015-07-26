From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 26 Jul 2015 12:47:23 +0200
Subject: [Buildroot] [PATCHv2] core/download: don't be needlessly
 verbose in backends
In-Reply-To: <1437906386-31727-1-git-send-email-yann.morin.1998@free.fr>
References: <1437906386-31727-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LW1S1jJOBM7V-fP_2N+UrhaTcS27+xni4TXQuhYskHjTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 26, 2015 at 12:26 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> In 50c8b7e (support/download: support -q in all download backends), the
> backend were made to respect the quietness of the main Makefile, when -s
> is poassed on the 'make' command line. In doing so, they were all made
> to be verbose by default.
>
> However, the verbosity of some of the tools, like scp, is very high, and
> is in fact intended for debug purposes.
>
> Drop being verbose by default, just use whatever each tool deems normal
> output. Only respect the quietness requested by the user.
>
> Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

(I tested the scp change already, and did manual tests of the output
differences for hg, wget and cp.)
