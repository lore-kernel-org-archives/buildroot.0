From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:55:34 +0100
Subject: [Buildroot] [PATCH v2] schifra: fix build of examples and add
 hash
In-Reply-To: <1414491461-9629-1-git-send-email-arnout@mind.be>
References: <1414491461-9629-1-git-send-email-arnout@mind.be>
Message-ID: <20141028185534.7e3aafb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 28 Oct 2014 11:17:41 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The OPTIONS argument passed to make had a redundant -o option, leading
> to:
> 
> g++ -pipe -Os   -o -o schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp -lstdc++ -lm
> arm-linux-musleabi-g++: error: schifra_reed_solomon_speed_evaluation: No such file or directory
> 
> Fixes:
> http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/
> 
> This error didn't occur before because upstream has silently updated
> the tarball. To protect against this in the future, a hash is added as
> well.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/schifra/schifra.hash | 3 +++
>  package/schifra/schifra.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/schifra/schifra.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
