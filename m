From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 09:29:04 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-download: verify the hashes from
 the download wrapper
In-Reply-To: <eb25ccfd009955fcd6be60822a8c22985aca199d.1417475935.git.yann.morin.1998@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <eb25ccfd009955fcd6be60822a8c22985aca199d.1417475935.git.yann.morin.1998@free.fr>
Message-ID: <20141202092904.7b6ce375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  2 Dec 2014 00:24:08 +0100, Yann E. MORIN wrote:
> Instead of repeating the check in our download rules, delegate the check
> of the hashes to the download wrapper.
> 
> This needs three different changes:
> 
>   - add a new argument to the download wrapper, that is the full path to
>     the hash file; if the hash file does not exist, that does not change
>     the current behaviour, as the existence of the hash file is done by
>     the check-hash script;

It is really time to use getopt in the download wrapper scripts, as we
have discussed with Fabio recently regarding the fully silent build
thing.

>   - add a third argument to the check-hash script, to be the basename of
>     the file to check; this is required because we no longer check the
>     final file with the finale filename, but anintermediate file with a

finale -> final

anintermediate -> an intermediate

>     temporary filename;
> 
>   - do the actual cal to the check-hash script form within the download

cal?

form -> from.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
