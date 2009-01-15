From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 09:57:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
In-Reply-To: <20090115062806.91B6E76850@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Thu\, 15 Jan 2009 06\:28\:06 +0000 \(UTC\)")
References: <20090115062806.91B6E76850@busybox.osuosl.org>
Message-ID: <877i4x9cai.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-15 06:28:05 +0000 (Thu, 15 Jan 2009)
 ulf> New Revision: 24852

 ulf> Log:
 ulf> Always create shared python library, if python is created, needed by multiple packages

 ulf> +$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 ulf> +		cp -dpr $(PYTHON_DIR)/libpython*.so.* $(STAGING_DIR)/usr/lib
 ulf> +		(\
 ulf> +		cd $(STAGING_DIR)/usr/lib ; \
 ulf> +		rm -f libpython$(PYTHON_VERSION_MAJOR).so ; \
 ulf> +		ln -s `basename  \`ls libpython*.so.*\`` libpython$(PYTHON_VERSION_MAJOR).so \
 ulf> +		)

What are you trying to do here?

-- 
Bye, Peter Korsgaard
