From: Arnaud Aujon <arnaud@intelibre.fr>
Date: Sun, 06 Apr 2014 16:33:20 +0200
Subject: [Buildroot] [PATCH v1] Python script to check package version
In-Reply-To: <1396793621-6795-1-git-send-email-arnaud@intelibre.fr>
References: <1396793621-6795-1-git-send-email-arnaud@intelibre.fr>
Message-ID: <351818e996b096f78e7ce2524064c63e@intelibre.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is still a few things to do, but I wanted to share it with you now 
to have some feedbacks and to show you I'm still interested in this.

What's next :
  * Packages hosted on sourceforge are not checked because the way i used 
to check new version is broken by design (basically just call a /latest/ 
url, with return last release from one of the project hosted on this 
sourceforge account)
  * alioth.debian.org has been disabled too (release directory listing is 
forbidden, so have to use another way)
  * Add a way to check python packages (probably easy)
  * Add a way to check lua packages (no idea of how it works yet)

Regards,

Arnaud Aujon



Le 06/04/2014 16:13, Arnaud Aujon a ?crit?:
> This patch introduce a new Python script to check package upstream 
> version.
> It aims to replace the current pkg-stats used by the autobuld server.
> For every package, information available is :
>  * patch count
>  * infrastructure
>  * presence of licence files
>  * current version
>  * last upstream version
> 
