From: Craig Lawton-Devine <craig.lawtondevine@googlemail.com>
Date: Thu, 11 Mar 2010 16:45:42 +0000
Subject: [Buildroot] generating gdb for the target
In-Reply-To: <d51100e91003110536q4d7a3482h5de85f085605cbf3@mail.gmail.com>
References: <d51100e91003110536q4d7a3482h5de85f085605cbf3@mail.gmail.com>
Message-ID: <d51100e91003110845n38b2cef4v42a6e74739f05fe4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have managed to circumvent this problem, it's nasty and I don't
recommend it but it worked for me.

Look in: output/build/gdb-6.8-target/gdb/config.cache
and make the following change:
gdb_cv_var_elf=${gdb_cv_var_elf=no}
gdb_cv_var_elf=${gdb_cv_var_elf=yes}

then:
rm output/build/gdb-6.8-target/.configured
make

and you should find that gdb will now work on the target.

Craig
