From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 10 May 2020 17:12:37 +0000
Subject: [Buildroot] [Bug 12876] putilimp.h **error**: missing binary
 operator before token "(" #elif __has_builtin(__c11_atomic_load) && \
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-PtiIpxMeSA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

--- Comment #2 from yogesh kumar sharma <yogesh2760781@gmail.com> ---
(In reply to Fabrice Fontaine from comment #1)
it not solve the issue. 
what i did was i opened file nodejs.mk and added the line suggested like this 

(cd $(@D); \
                $(HOST_CONFIGURE_OPTS) \
                PATH=$(@D)/bin:$(BR_PATH) \
                PYTHON=$(HOST_DIR)/bin/python2 \
                $(HOST_DIR)/bin/python2 ./configure \
                --prefix=$(HOST_DIR) \
                --without-snapshot \
                --without-dtrace \
                --without-etw \
                --shared-openssl \
                --shared-openssl-includes=$(HOST_DIR)/include/openssl \
                --shared-openssl-libpath=$(HOST_DIR)/lib \
                --shared-zlib \
                --shared-zlib-includes=$(HOST_ZLIB_SRCDIR) \
                --shared-zlib-libpath=$(HOST_DIR)/lib \
                --no-cross-compiling \
                --with-intl=small-icu \

is that ok? or i have to add through patch. Actual i am not aware of how to add
patch in buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
