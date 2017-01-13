From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 13 Jan 2017 10:31:14 +0100
Subject: [Buildroot] [PATCH 1/1] python: disable _ssl.c build when
 --disable-ssl
In-Reply-To: <1484169742-28866-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1484169742-28866-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <39092efc-7691-8091-8ae2-fb1e60e170e5@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2017 22:22, Matt Weber wrote:
> From: Adam <adam.allison@rockwellcollins.com>
> 
> When --disable-ssl is provided as an option,
> prevent the building of _ssl.c.
> Without this change, some GCC toolchains fail
> to build the _ssl module depending on the
> build configuration
> (we observed 4.85 worked and 4.9.4).
> 
> Signed-off-by: Adam Allison <adam.allison@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/python/111-optional-ssl.patch | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

I sent a patch doing the same thing, which was marked as superseeded
in patchwork: https://patchwork.ozlabs.org/patch/696139/
