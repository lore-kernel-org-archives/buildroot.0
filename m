From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:37:31 +0100
Subject: [Buildroot] [PATCH] package/python-pip: needs hashlib module
In-Reply-To: <20201122143054.2184089-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Sun, 22 Nov 2020 15:30:54 +0100")
References: <20201122143054.2184089-1-b.bilas@grinn-global.com>
Message-ID: <87pn43u544.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > Without hashlib module pip returns the following errors:
 > # pip
 > ValueError: unsupported hash type sha224
 > ERROR:root:code for hash sha256 was not found.
 > Traceback (most recent call last):
 >   File "/usr/lib/python2.7/hashlib.py", line 147, in <module>
 >   File "/usr/lib/python2.7/hashlib.py", line 97, in __get_builtin_constructor
 > ValueError: unsupported hash type sha256
 > ERROR:root:code for hash sha384 was not found.
 > Traceback (most recent call last):
 >   File "/usr/lib/python2.7/hashlib.py", line 147, in <module>
 >   File "/usr/lib/python2.7/hashlib.py", line 97, in __get_builtin_constructor
 > ValueError: unsupported hash type sha384
 > ERROR:root:code for hash sha512 was not found.
 > Traceback (most recent call last):
 >   File "/usr/lib/python2.7/hashlib.py", line 147, in <module>
 >   File "/usr/lib/python2.7/hashlib.py", line 97, in __get_builtin_constructor
 > ValueError: unsupported hash type sha512
 > Traceback (most recent call last):
 >   File "/usr/bin/pip", line 11, in <module>
 >     load_entry_point('pip==20.0.2', 'console_scripts', 'pip')()
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/cli/main.py", line 73, in main
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/commands/__init__.py", line 96, in create_command
 >   File "/usr/lib/python2.7/importlib/__init__.py", line 37, in import_module
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/commands/install.py", line 24, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/cli/req_command.py", line 15, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/index/package_finder.py", line 21, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_internal/index/collector.py", line 12, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/requests/__init__.py", line 43, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/urllib3/__init__.py", line 7, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/urllib3/connectionpool.py", line 29, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/urllib3/connection.py", line 40, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/urllib3/util/__init__.py", line 7, in <module>
 >   File "/usr/lib/python2.7/site-packages/pip/_vendor/urllib3/util/ssl_.py", line 8, in <module>
 > ImportError: cannot import name md5

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
