From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 09:00:06 +0100
Subject: [Buildroot] genmanual: generates kconfiglib.pyc in Buildroot
 source tree
In-Reply-To: <20131204225227.GH3332@free.fr>
References: <20131204225227.GH3332@free.fr>
Message-ID: <52A03286.3070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/13 23:52, Yann E. MORIN wrote:
> Samuel, All,
>
> When one runs 'make manual', python will create:
>      support/scripts/kconfiglib.pyc
> in the Buildroot source tree.
>
> Python will happily run, even if it is not able to generate that file
> (eg. because the source tree is read-only).
>
> However, the file is not cleaned on 'make clean'. I'm a bit reluctant at
> adding it since it would try to remove a file outside of $(O), which
> could break parallel builds in multiple $(O) at the same time... Not
> sure what to do here.
>
> Since we do not really care about speed, would it be possible to tell
> python not to generate it at all?

  I do 'man python', and the first thing I see is

-B     Don't write .py[co] files on import. See also PYTHONDONTWRITEBYTECODE.


  I'd say, go for it! Unfortunately, you can't add it directly in the #! 
line of the script because all the arguments are concatenated together. 
So I guess the PYTHONDONTWRITEBYTECODE environment variable should be set 
when calling the script.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
