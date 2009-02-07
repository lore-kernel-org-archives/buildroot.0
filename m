From: Claus Klein <claus.klein@arcormail.de>
Date: Sat, 7 Feb 2009 23:10:44 +0100
Subject: [Buildroot] 2009.02-rc3 released
In-Reply-To: <87skmyirxq.fsf@macbook.be.48ers.dk>
References: <87skmyirxq.fsf@macbook.be.48ers.dk>
Message-ID: <3465FC6D-040F-475F-8AFA-BB3F1F0C7E5E@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I  tried to build the default busybox on mac-OX, but it failed.

A year ago, I tried to build a buildsystem based on a minmal system  
like DSL using busybox tools.
but it failed too.

I want to build a cross-development tool-chain and the embedded  
destination system at a small virtual vmware image.

So I want to ask if it is possible to use only posix conform options  
when building a system with buildroot?
At leased, the options available at the busybox should be enough, or  
not?

And to start, there is a small patch to fix my first problem I had:

claus-kleins-macbook-pro:buildroot-2009.02-rc3 clausklein$ diff -u  
package/editors/vim/vim.mk package/editors/vim/vim.mk.ck
--- package/editors/vim/vim.mk	2009-01-31 22:30:46.000000000 +0100
+++ package/editors/vim/vim.mk.ck	2009-02-07 22:39:28.000000000 +0100
@@ -9,7 +9,7 @@
  VIM_SOURCE_SITE:=$(VIM_SITE)/unix
  VIM_PATCH_SITE:=$(VIM_SITE)/patches/7.1
  VIM_DIR:=$(BUILD_DIR)/vim71
-VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -s 's:\(.\+ 
\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
+VIM_PATCHES:=$(shell cat package/editors/vim/patches | sed -e 's:\(.\+ 
\):$(DL_DIR)/vim/$(VIM_VERSION).\1:')
  VIM_CONFIG_H:=$(VIM_DIR)/src/auto/config.h
  VIM_CONFIG_MK:=$(VIM_DIR)/src/auto/config.mk

claus-kleins-macbook-pro:buildroot-2009.02-rc3 clausklein$


//BR

Claus


Am 01.02.2009 um 07:37 schrieb Peter Korsgaard:

> Hi,
>
> -rc3 is out:
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc3.tar.gz
>
> or
>
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc3.tar.bz2
>
> Please give it a spin and report back issues to the mailing list or
> the bug tracker.
