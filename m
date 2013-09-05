From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 5 Sep 2013 17:11:26 +0800
Subject: [Buildroot] libgtk2 build error (2013.08)
Message-ID: <20130905091126.GC15735@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, list

With 2013.08 buildroot, it can failed in building libgtk2. It seems it
failed in the stage of building gtk tutorials.

---
make[4]: Entering directory `/home/woody/src/buildroot-2013.08/output/build/libgtk2-2.24.18/docs/tutorial'
if test -w .; then \
  (cd .; \
   db2html gtk-tut.sgml; \
   test -d html && rm -r html; \
   mv gtk-tut html; \
   mkdir html/images; \
   cp images/*.png html/images); \
fi
Using catalogs: /etc/sgml/catalog
Using stylesheet: /usr/share/sgml/docbook/utils-0.6.14/docbook-utils.dsl#html
Working on: /home/woody/src/buildroot-2013.08/output/build/libgtk2-2.24.18/docs/tutorial/gtk-tut.sgml
mv: cannot stat 'gtk-tut': No such file or directory
mkdir: cannot create directory 'html/images': No such file or directory
cp: target 'html/images' is not a directory
make[4]: *** [html] Error 1
---

I remembered the samething not happened in 2013.05. And, I started my
buildroot 2013.08 from a 2013.05 config file (make defconfig), is that a
problem?

-- 
I can't go back to yesterday - because I was a different person then
