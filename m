From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:28:30 +0200
Subject: [Buildroot] [PATCH 03/24 v2] package/skeleton: respect
 variables namespace
In-Reply-To: <7950eef90e6041159471bdb69b3ea1273671c564.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <7950eef90e6041159471bdb69b3ea1273671c564.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705152830.1a54587c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:25 +0200, Yann E. MORIN wrote:
> In makefiles, variables have global scope. We traditionally ensure that
> we get no name clashing by prefixing all variables with the package
> name.
> 
> Currently, this is not the case in the skeleton package, for historical
> reasons (code snippets copied over from the common Makefiles). We
> currently have a mix of naming for the variables:
>   - some are indeed prefixed with SKELETON_
>   - some are prefixed with SYSTEM_
>   - some are prefixed with both
>   - some are not prefixed
> 
> Clean up these discrepancies, and prefix all variables with just
> SKELETON_ and drop the SYSTEM_ prefix.
> 
> Also include SET_ in all variables that do set something (getty) for
> consistency across all the variables.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/skeleton/skeleton.mk | 60 ++++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
