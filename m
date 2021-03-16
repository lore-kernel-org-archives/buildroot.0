From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:58:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/json-for-modern-cpp: enable
 multiple headers by default
In-Reply-To: <20210315081702.5727-1-dimitrij.kotrev@googlemail.com>
References: <20210315081702.5727-1-dimitrij.kotrev@googlemail.com>
Message-ID: <20210316215800.639aca4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 09:17:02 +0100
Dimitrij Kotrev <dimitrij.kotrev@googlemail.com> wrote:

> json-for-modern-cpp provides an option to enable multiple headers support.
> Currently this option is disabled and the package creates just a
> single header: "nlohmann/json.hpp", which contains everything. Enabling
> this option, splits this single header into multiple ones. First of all
> this provides an additional header: "nlohmann/json_fwd.hpp", which contains
> only forwarding declarations of types provided by this library. This
> gives you a more finer control over include dependencies and can speed up
> build times significantly. The top level header: "nlohmann/json.hpp" is
> still there and therefore code which used it before, would stay compatible.
> 
> Signed-off-by: Dimitrij Kotrev <dimitrij.kotrev@googlemail.com>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
