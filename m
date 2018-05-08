From: abinaya m <abi.laesr@gmail.com>
Date: Tue, 8 May 2018 14:51:14 +0530
Subject: [Buildroot] package_installation_problem
Message-ID: <CAAp1OY35UgMMmtK-CG+Y3JKLLy78u+KRbOwtR-FugwrVr804ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear sir,
     i am abi.i would like to  created a simple c program with Make file
that output want to be store in /etc/bin file for customized os of
*atmel-sama5-D3-xplained*. There is no error after "make".but the
executable file is not present in bin file after make.now only i started
buildroot from the scratch.kindly help me sir.

i followed these steps:

*STEP 1:*

*create a folder as "asd" in / /home/laptop105/sama5_abi/abi_package/asd
Directory

*inside the directory water.c and Makefile

*water.c file:*
                #include <stdio.h>
                int main(){
while(1)
{
printf("bulidroot world\n");
sleep(1);
}
return 0;
}

*Makefile:*


OBJS=water.o

all: water

helloworld: $(OBJS)
$(CC) $(LDFLAGS) -o ammu $(OBJS)

$(OBJS): %.o: %.c
$(CC) $(CFLAGS) -c -o $@ $<
clean:
rm -f $ (OBJ)

install:
cp ammu $ (DESTDIR) / bin / ammu

*STEP 2:*
      directory ---> bulidroot-at91/package/water   inside that Config.in &
water.mk

*Config.in:*
        config BR2_PACKAGE_WATER
    bool "water"
    help
      Hello World package says hello world to you
      see http://water.com for more on this software

*water.mk <http://water.mk>:*


WATER_VERSION:= 1.0.0
WATER_SITE:= /home/laptop105/sama5_abi/abi_package/asd
WATER_SITE_METHOD:=local
WATER_INSTALL_TARGET:=YES

define WATER_BUILD_CMDS
        $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define WATER_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/ammu $(TARGET_DIR)/bin
endef

define WATER_PERMISSIONS
       /bin/ammuf 4755 0 0 - - - - -
endef

$(eval $(generic-package))

*STEP 3:*

*buildroot-at91/package/Config.in inside the  file i put*


menu "Misc"
    *source "package/water/Config.in"*
endmenu


*STEP 4:*

*                    make atmel_sama5d3_xplained_mmc_defconfig*
*                    make menuconfig*






Thanks
With regards
abinaya
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180508/5f4a4298/attachment.html>
