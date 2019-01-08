From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 16:22:47 +0100
Subject: [Buildroot] [PATCH 14/19] support/check-uniq-files: don't
 report files of the same content
In-Reply-To: <18f69b9fb1e0277f26c40609c6fc16e25b9d689a.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <18f69b9fb1e0277f26c40609c6fc16e25b9d689a.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXJpCUMwZNrwop-YG=gTMyox3yOCT-D8+ChUV=J8GRwCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 7 ene. 2019 a las 23:07, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Currently, we check that no two packages write to the same files, as a
> sanity check. We do so by checking which files were touched since the
> end of the build (aka beginning of the installation).
>
> However, when the packages do install the exact same file, i,e, the
> same content, we in fact do not really care what package had provided
> said file.
>
> In the past, we avoided that situation because we were md5sum-inf every
> files before and after installation. Anything that changed was new or

md5sum-ing
'all files' or 'every file'
