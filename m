From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Apr 2020 06:41:29 +0300
Subject: [Buildroot] [PATCH] package/asn1c: new host package
In-Reply-To: <CAEyMn7Y=aY1zO0Wm5wVzHrdmn=CDrzJJ=aepgm5rXXJ4Hir-uw@mail.gmail.com>
References: <20200110211420.7704-1-sergio.prado@e-labworks.com>
 <CAEyMn7Y=aY1zO0Wm5wVzHrdmn=CDrzJJ=aepgm5rXXJ4Hir-uw@mail.gmail.com>
Message-ID: <87imhwcfbq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko, Sergio,

On Fri, Apr 17 2020, Heiko Thiery wrote:
>> +ASN1C_VERSION = 0.9.28
>> +ASN1C_SITE = https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
>
> You can use the github macro to set the <pkg>_SITE variable:
> ASN1C_SITE = $(call github,vlm,asn1c,v$(ASN1C_VERSION))

When the package author provides a tarball we usually prefer to use it.

  If the package you wish to add does have a release section on GitHub,
  the maintainer may have uploaded a release tarball, or the release may
  just point to the automatically generated tarball from the git tag. If
  there is a release tarball uploaded by the maintainer, we prefer to use
  that since it may be slightly different (e.g. it contains a configure
  script so we don?t need to do AUTORECONF).

This is quoted from
https://buildroot.org/downloads/manual/manual.html#github-download-url

In this case the tarball indeed contains a pre-generated configure
script.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
