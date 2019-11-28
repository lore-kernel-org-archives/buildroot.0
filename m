From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 28 Nov 2019 16:40:51 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <20191128163653.42628ee8@windsurf>
Message-ID: <2997576693-13830@mail.unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com> 

 To:   Pascal de Bruijn <p.debruijn@unilogic.nl> 
 Cc:   <buildroot@busybox.net> 
 Sent:   11/28/2019 4:36 PM 
 Subject:   Re: [Buildroot] [PATCH] package/postgresql: fix filesystem naming consistency 

On Thu, 28 Nov 2019 12:15:42 +0100 
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote: 
 
> Currently the service is called postgresql, but other filesystem 
> references are called pgsql, which is inconsistent and confusing. 
>  
> Given that at least Debian uses postgresql in the filesystems 
> as well I would suggest moving the filesystem reference to align 
> with the service name as opposed to the other way around. 
>  
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl> 
> --- 
> ?package/postgresql/Config.in ? ? ? ? ?| 2 +- 
> ?package/postgresql/S50postgresql ? ? ?| 8 ++++---- 
> ?package/postgresql/postgresql.mk ? ? ?| 4 ++-- 
> ?package/postgresql/postgresql.service | 6 +++--- 
> ?4 files changed, 10 insertions(+), 10 deletions(-) 
>  
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in 
> index e548d3c..2f677da 100644 
> --- a/package/postgresql/Config.in 
> +++ b/package/postgresql/Config.in 
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_POSTGRESQL 
> ? ? ? ? database system. 
> ? 
> ? ? ? ? Enable the readline package to gain readline support in 
> - ? ? ? pgsql (the command line interpreter), which offers 
> + ? ? ? psql (the command line interpreter), which offers 
 
This doesn't seem to be related to the commit. Also, is the command 
line tool really called psql ? 


Yes, it's not directly related, but just a minor typo fix.


The command is indeed called psql.


Regards,
Pascal de Bruijn
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191128/ff218cd1/attachment.html>
