From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:51:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: add GO_CPE_ID_VENDOR
In-Reply-To: <20210111203624.1416107-1-fontaine.fabrice@gmail.com>
References: <20210111203624.1416107-1-fontaine.fabrice@gmail.com>
Message-ID: <20210111215127.4d52033e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 21:36:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> golang is the correct CPE ID vendor for the go package, see:
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agolang%3Ago
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/go/go.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. Notice that the CPE dictionary only has up
to 1.15.5, while we have 1.15.6 in Buildroot. So this would be a good
case of using the "missing-cpe" target that
https://patchwork.ozlabs.org/project/buildroot/list/?series=223181 is
introducing, and then see how it goes in submitting the resulting XML
to NIST.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
