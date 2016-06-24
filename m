From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 17:08:28 +0200
Subject: [Buildroot] [PATCH 11/13 v7] core/legal-info: generate a hash
 of all saved files
In-Reply-To: <a96a39a5d8ae941eb19df25cbaff28b92614749f.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <a96a39a5d8ae941eb19df25cbaff28b92614749f.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624170828.2575b37d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:36 +0200, Yann E. MORIN wrote:
> Having a hash of the saved files can be interesting for the recipient to
> verify the integrity of the files.
> 
> We remove the warning file earlier, to exclude it from the hash list.

I added an explanation here about why we generate into a temporary file.

> -	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
>  	@rm -f $(LEGAL_WARNINGS)
> +	@(cd $(LEGAL_INFO_DIR); \
> +	  find * -type f -exec sha256sum {} + \
> +	  |LC_ALL=C sort -k2 \
> +	  >.legal-info.sha256; \
> +	  mv .legal-info.sha256 legal-info.sha256 \
> +	)

I've fixed a bit the indentation here to be more consistent with the
usual style in Buildroot, i.e using tabs, and splitting lines a bit
less.

Applied with those minor issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
