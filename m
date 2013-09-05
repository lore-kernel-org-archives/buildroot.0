From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Sep 2013 18:57:50 +0200
Subject: [Buildroot] libgtk2 build error (2013.08)
In-Reply-To: <20130905091126.GC15735@zuhnb712.ap.bm.net>
References: <20130905091126.GC15735@zuhnb712.ap.bm.net>
Message-ID: <5228B80E.7010900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/13 11:11, Woody Wu wrote:
> Hi, list
>
> With 2013.08 buildroot, it can failed in building libgtk2. It seems it
> failed in the stage of building gtk tutorials.
>
> ---
> make[4]: Entering directory `/home/woody/src/buildroot-2013.08/output/build/libgtk2-2.24.18/docs/tutorial'
> if test -w .; then \
>    (cd .; \
>     db2html gtk-tut.sgml; \
>     test -d html && rm -r html; \
>     mv gtk-tut html; \
>     mkdir html/images; \
>     cp images/*.png html/images); \
> fi
> Using catalogs: /etc/sgml/catalog
> Using stylesheet: /usr/share/sgml/docbook/utils-0.6.14/docbook-utils.dsl#html
> Working on: /home/woody/src/buildroot-2013.08/output/build/libgtk2-2.24.18/docs/tutorial/gtk-tut.sgml
> mv: cannot stat 'gtk-tut': No such file or directory
> mkdir: cannot create directory 'html/images': No such file or directory
> cp: target 'html/images' is not a directory
> make[4]: *** [html] Error 1
> ---
>
> I remembered the samething not happened in 2013.05. And, I started my
> buildroot 2013.08 from a 2013.05 config file (make defconfig), is that a
> problem?

  Weird, works for me. Is it possible you have a different version of 
db2html, that stores its output in some other place than gtk-tut/ ?

  Ideally, of course, we should avoid building the docs in the first place...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
