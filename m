From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 30 Mar 2011 02:46:06 +0100
Subject: [Buildroot] Missing $(PYTHON_SITE_PACKAGE_DIR) in python.mk
 rewrite
In-Reply-To: <AANLkTi=h8RcWD5ZYQbx438P1m7QuRtpFjEDREGau4sQQ@mail.gmail.com>
References: <AANLkTi=h8RcWD5ZYQbx438P1m7QuRtpFjEDREGau4sQQ@mail.gmail.com>
Message-ID: <1301449567.21198.1.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-serial is in buildroot-2011.02
take a look on
package/python-serial/python-serial.mk

On Fri, 2011-03-25 at 19:21 -0300, Thiago A. Corr?a wrote:
> Hi,
> 
>     I had some packages that depended on the above variable being
> available in buildroot. For example pyserial (pyserial.sf.net). Could
> you guys add it back? Otherwise, how should I build generate that
> value in my .mk files?
> 
>     Below is my makefile for pyserial.
> 
> Kind Regards,
>     Thiago A. Correa
> 
> #############################################################
> #
> # PySerial - Serial port classes for Python
> #
> #############################################################
> #
> PYSERIAL_VERSION:=2.5
> PYSERIAL_SOURCE:=pyserial-$(PYSERIAL_VERSION).tar.gz
> PYSERIAL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pyserial/
> PYSERIAL_DIR=$(BUILD_DIR)/pyserial-$(PYSERIAL_VERSION)
> PYSERIAL_CAT=$(ZCAT)
> 
> $(DL_DIR)/$(PYSERIAL_SOURCE):
>     $(call DOWNLOAD,$(PYSERIAL_SITE),$(PYSERIAL_SOURCE))
> 
> $(PYSERIAL_DIR)/.unpacked: $(DL_DIR)/$(PYSERIAL_SOURCE)
>     $(PYSERIAL_CAT) $(DL_DIR)/$(PYSERIAL_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
>     touch $@
> 
> $(PYSERIAL_DIR)/.installed: $(PYSERIAL_DIR)/.unpacked
>     cp -a $(PYSERIAL_DIR)/serial $(PYTHON_SITE_PACKAGE_DIR)
>     touch $@
> 
> pyserial: $(PYSERIAL_DIR)/.installed
> 
> pyserial-clean:
>     -rm -rf $(PYTHON_SITE_PACKAGE_DIR)/serial
> 
> ifeq ($(strip $(BR2_PACKAGE_PYSERIAL)),y)
> TARGETS+=pyserial
> endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110330/2a76c5cd/attachment.bin>
