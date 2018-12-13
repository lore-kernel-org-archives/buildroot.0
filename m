From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 13 Dec 2018 07:53:05 -0200 (BRST)
Subject: [Buildroot] <PKG>_SOURCE without a version?
In-Reply-To: <CAJtjsKZ8j6x9cHEuCZVuYu0YVcYZjzxM4vYpbPek+PZ7cC7cvQ@mail.gmail.com>
References: <CAJtjsKZ8j6x9cHEuCZVuYu0YVcYZjzxM4vYpbPek+PZ7cC7cvQ@mail.gmail.com>
Message-ID: <1575802942.2620821.1544694785908.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Johan Oudinet" <johan.oudinet@gmail.com>
> To: "buildroot" <buildroot@buildroot.org>
> Sent: Quarta-feira, 12 de dezembro de 2018 17:01:11
> Subject: [Buildroot] <PKG>_SOURCE without a version?

> Hi,
> 
> I'm packaging a project which distributes its sources without a
> version number in the filename. The version is present in the URL, but
> I'm wondering if the download architecture can handle a version bump
> properly, or if it would stick to the file in <PKG>_DL_DIR from an
> older version?
> 
> Looking at the other packages, I found package/jquery-sparkline that
> has the same "issue".
> Its version has been bump several times. So either this is a bug and
> no one noticed it until now, or the download step can detect somehow
> when it has to download the file again?
> 
> Best,
> --
> Johan

You can cheat, as in

    https://patchwork.ozlabs.org/patch/849230/

Notice that we use $(<PKG>_DL_DIR) now, instead of $(DL_DIR).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
