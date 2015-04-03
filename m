From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 03 Apr 2015 10:31:04 -0300
Subject: [Buildroot] [PATCH] package/ca-certificates: generate the
	bundle of certs
In-Reply-To: <1428016146-15442-1-git-send-email-yann.morin.1998@free.fr>
References: <1428016146-15442-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <551E9618.9060409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/2015 08:09 PM, Yann E. MORIN wrote:

> glib-networking wants to use the certificates bundle, not the individual
> certificates.
> 
> Generating the bundle is usually done with update-ca-certificates, but
> that does not support running out-of-tree.
> 
> Fortiunately, and as Gustavo put it, update-ca-certificates is jsut a
> glorified 'cat'. It is supposed to be fed a config file stating which
> certificate to add/remove to/from the bundle, otherwise nothing fancy
> (Oh, yes, running hooks after updating the bundle).
> 
> Since we do not need any of this in Buidlroot, we jsut generate a bundle
> with all certificates unconditionally.
> 
> Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
(midori qemu-arm-vexpress with good certificate site + bad site)
(when this was missing it would report every site as bad CA when
clicking on the lock icon "the signing certificate authority is not
know" - besides the console warning).
Regards.
