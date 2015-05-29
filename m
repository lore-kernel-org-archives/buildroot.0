From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 29 May 2015 21:39:09 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <1432636689-26907-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432636689-26907-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1432928349.3676.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Di, 2015-05-26 at 12:38 +0200, J?rg Krause wrote:
> host-mtd build fails with gcc 5.1:
>   error: redefinition of ?hashtable_iterator_key?
>   error: redefinition of ?hashtable_iterator_value?
> 
> Indeed, both functions are defined twice - once in the header and 
> once in the
> source file. This is permitted in C11 (and maybe in C99).
> 
> Add a patch sent to upstream:
> https://patchwork.ozlabs.org/patch/467254/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v2 -> v3:
>   - Add Sob and URL to patch description (Baruch Siach)
> 
> Changes v1 -> v2:
>   - Use (identical) patch sent upstream
> ---

Patch is accepted upstream now. I suggest to add this patch to 2015.05.

Best regards
J?rg Krause
