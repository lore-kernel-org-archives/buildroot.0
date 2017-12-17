From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:19:11 +0100
Subject: [Buildroot] [PATCH v2] gdb: prevent installation of libbfd.so
 and libopcode.so
In-Reply-To: <20171208212952.20366-1-ps.report@gmx.net>
References: <20171208212952.20366-1-ps.report@gmx.net>
Message-ID: <20171217101911.07722d36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Dec 2017 22:29:52 +0100, Peter Seiderer wrote:
> The gdb install target installs dynamic versions of libbfd and
> libopcode, accidentally overwriting the binutils provided versions
> (gdb itself links against the bundled static ones to avoid
> version problems, so the dynamic ones are un-needed).
> 
> Prevent the installation by using the '--disable-install-libbfd'
> configure option.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - enhance commit log (suggested by Thomas Petazzoni)
>   - use --disable-install-libbfd instead of --disable-shared
> ---
>  package/gdb/gdb.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks a lot for the much clearer explanation, now everything is clear.
Patch applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
