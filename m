From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Apr 2009 15:32:05 +0200
Subject: [Buildroot] Working on a wxWidgets build
In-Reply-To: <79A10089-9847-4B61-A91D-0C0AA181F1C1@cannasoftware.com> (Lloyd
	Sargent's message of "Wed\, 1 Apr 2009 08\:26\:38 -0500")
References: <79A10089-9847-4B61-A91D-0C0AA181F1C1@cannasoftware.com>
Message-ID: <87iqlo7b56.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lloyd" == Lloyd Sargent <lloyd@cannasoftware.com> writes:

Hi,

 Lloyd> foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)

 Lloyd> Which makes sense. However I need something along the lines of:

 Lloyd> foo: uclibc libglib2 libgtk2  $(TARGET_DIR)/$(FOO_TARGET_BINARY)

 Lloyd> for one set of options and

 Lloyd> foo: uclibc $(TARGET_DIR)/$(FOO_TARGET_BINARY)

 Lloyd> for a different set of options.

Stick them in a variable or use the $(if ) construct. See
package/grep/grep.mk or package/multimedia/alsa-utils/alsa-utils.mk
for examples.

-- 
Bye, Peter Korsgaard
