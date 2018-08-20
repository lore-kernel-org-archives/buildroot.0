From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 20 Aug 2018 10:05:15 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-cryptography: bump
 version to 2.3.1
In-Reply-To: <9fro4fx8c7.ln2@ID-313208.user.individual.net>
References: <20180819184242.21134-1-bernd.kuhls@t-online.de>
 <CAGm1_kvHG2zGtw8U200teJtVnjAOf57t_5XCxRsb3TsBjLi69Q@mail.gmail.com>
 <9fro4fx8c7.ln2@ID-313208.user.individual.net>
Message-ID: <CAGm1_ktoBnagq89z6WbQcTCB4Fkc5bY2YqEnpy3PeVZbMST_hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 19, 2018 at 9:02 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Am Sun, 19 Aug 2018 20:53:49 +0200 schrieb Yegor Yefremov:
>
>> Have you performed runtime tests?
>
> Hi Yegor,
>
> no, only build-tested with openssl-1.1.0i.

I've performed a runtime test and I still get:

# python
Python 3.6.3 (default, Aug 20 2018, 08:30:51)
[GCC 7.3.1 20180425 [linaro-7.3-2018.05 revision
d29120a424ecfbc167ef90065c0eeb on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from cryptography.fernet import Fernet
>>> key = Fernet.generate_key()
random: nonblocking pool is initialized
>>> f = Fernet(key)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/fernet.py", line
32, in __init__
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/__init__.py",
line 15, in default_backend
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/openssl/__init__.py",
line 7, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/openssl/backend.py",
line 53, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 13, in <module>
ImportError: /usr/lib/python3.6/site-packages/cryptography/hazmat/bindings/_openssl.abi3.so:
undefined symbol: pthread_atfork

That's why the packaged wasn't updated for a long time.

Yegor
