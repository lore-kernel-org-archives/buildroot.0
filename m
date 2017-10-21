From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:37:25 +0200
Subject: [Buildroot] [PATCH] raspberrypi: post-image.sh fix gpu_mem
 option
In-Reply-To: <20171021135214.18552-1-gael.portay@savoirfairelinux.com>
References: <20171021135214.18552-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171021213725.67daa97a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 09:52:14 -0400, Ga?l PORTAY wrote:
> The gpu_mem option is not using the proper option argument which causes sed to
> fail.
> 
> 	+ case "${arg}" in
> 	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
> 	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
> 	sed: -e expression #1, char 8: extra characters after command
> 	+ case "${arg}" in
> 	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
> 	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
> 	sed: -e expression #1, char 8: extra characters after command
> 
> The issue comes from the use of $1 instead of $arg to extract the gpu_mem
> value. $1 is the $(BINARIES_DIR) which leads to a sed expression error.
> 
> Also, it adds the error flag to the shell script to prevent from such situation
> and terminate the build in error.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  board/raspberrypi/post-image.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
