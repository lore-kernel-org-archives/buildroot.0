From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:04:58 +0100
Subject: [Buildroot] [PATCHv2] vim: be more careful when removing the
 documentation
In-Reply-To: <1480970192-13208-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1480970192-13208-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161205230458.3a8ea9d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 21:36:32 +0100, Thomas Petazzoni wrote:
> The current VIM_REMOVE_DOCS hook removes all .txt files from
> /usr/share/vim. Unfortunately, this also removes the rgb.txt file,
> which is needed at runtime for vim, as reported in bug #9466.
> 
> This commit changes VIM_REMOVE_DOCS to remove only
> /usr/share/vim/vim80/doc/. Size-wise, it's equivalent because:
> 
>  - We are no longer removing a few README.txt in other directories,
>    taking more space.
> 
>  - We are now removing the /usr/share/vim/vim*/doc/ folder entirely,
>    which contained a few files not named *.txt
> 
> So overall, the size of /usr/share/vim/ before and after this patch is
> still 11MB.
> 
> Fixes bug #9466.
> 
> Reported-by: Mateusz Furdyna <sir.ferdek@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
