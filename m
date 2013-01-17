From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 17:35:43 +0200
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <20130117160133.61661524@skate>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
 <20130117160133.61661524@skate>
Message-ID: <50F81A4F.6000705@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.1.2013 17:01, Thomas Petazzoni kirjoitti:
> The problem here is that since the filename doesn't end with .tar.gz,
> Buildroot doesn't know which extraction method to apply, and therefore
> doesn't apply any, which leads Buildroot to try to execute your tarball.
>
> Hum, I am not sure how to handle that. Should we try to extract simply
> with tar something that does not have an extension?

if you use tar with -a switch it is smart enough to extract it
correctly. Even if wrong extension or no extension at all.
For example:

mv bison-2.5.tar.gz bison-2.5.tar.xyz
tar -xaSvf bison-2.5.tar.xyz

mv bison-2.5.tar.gz bison-2.5
tar -xaSvf bison-2.5

Regards
Stefan
