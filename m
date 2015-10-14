From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Oct 2015 21:13:36 +0300
Subject: [Buildroot]
 =?iso-8859-1?q?host_=E2ckage__empty_dependency_list?=
In-Reply-To: <561E71EB.5080801@green-communications.fr>
References: <561E71EB.5080801@green-communications.fr>
Message-ID: <20151014181336.GO2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

On Wed, Oct 14, 2015 at 05:16:59PM +0200, Sylvain Raybaud wrote:
> I'd like the host variant of a package to have no dependency at all,
> while its target variant has some. Specifying an empty list with
> 
> HOST_FOO_DEPENDENCIES = ""
> 
> gives me an error. Not setting HOST_FOO_DEPENDENCY or setting
> HOST_FOO_DEPENDENCIES =
> 
> makes it inherit the dependencies of target variant. Is there a way to
> achieve this?

This is weird. Existing packages (e.g. tar, tcl, libcap, etc.) have

   HOST_LIBCAP_DEPENDENCIES =

and it seems to work for them. Please post the full .mk file, and the build 
error message.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
