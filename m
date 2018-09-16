From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 16:11:49 +0200
Subject: [Buildroot] [PATCH] libssh2: fix build failure due to pointer
 dereferencing ambiguity
In-Reply-To: <20180913080854.81306-1-giulio.benetti@micronovasrl.com>
References: <d3364deb-93ad-c152-4155-3680a7fc1e48@micronovasrl.com>
 <20180913080854.81306-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180916161149.3cd01686@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Sep 2018 10:08:54 +0200, Giulio Benetti wrote:
> When dereferencing from *aes_ctr_cipher, being a pointer itself,
> ambiguity can occur with compiler and build can fail reporting:
> openssl.c:574:20: error: ?*aes_ctr_cipher? is a pointer; did you mean to use ?->??
>      *aes_ctr_cipher->nid = type;
> 
> Add a patch to sorround every *aes_ctr_cipher-> occurence with
> paranthesis like this (*aes_ctr_cipher)->
> 
> Fixes:
> http://autobuild.buildroot.net/results/97c/97c43dd2122f55f3166683aa1b29ce1ca54bcb9c/
> http://autobuild.buildroot.net/results/4b7/4b728d275f1399e3cb72d40482076ee54b35852a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...ferencing-ambiguity-potentially-caus.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/libssh2/0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
