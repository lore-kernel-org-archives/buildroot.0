From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 12:46:07 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <0fad080c135d79abdbe042514e30b393c25f5a77.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <20131228124607.193ac484@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 00:12:51 +0100, Yann E. MORIN wrote:

> +%-graph-depends:
> +	@install -d $(O)/graphs
> +	@./support/scripts/graph-depends $(@:-graph-depends=) \
> +	|dot -Tpdf \
> +	-o $(O)/graphs/$(@).pdf

Why isn't that one done in the package infrastructure, i.e in
pkg-generic.mk ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
