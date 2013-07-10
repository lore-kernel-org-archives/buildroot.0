From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 19:55:28 +0200
Subject: [Buildroot]
 =?utf-8?q?Error_while_installing_dosfstools=3A_mkdosf?=
 =?utf-8?q?s=E2=80=99=3A_No_such_file_or_directory?=
In-Reply-To: <51DD94D9.6060001@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 10 Jul 2013 14:07:37 -0300")
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 <87obaciyn8.fsf@dell.be.48ers.dk>
 <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
 <87bo6ci9xk.fsf@dell.be.48ers.dk> <51DD6469.4010504@gmail.com>
 <20130710185808.56c3ac52@skate> <51DD94D9.6060001@zacarias.com.ar>
Message-ID: <87y59efgfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 07/10/2013 01:58 PM, Thomas Petazzoni wrote:
 >> Dear Daniel Hilst Selli,
 >> 
 >> On Wed, 10 Jul 2013 13:40:57 +0000, Daniel Hilst Selli wrote:
 >> 
 >>> Here, this solves my problem.
 >>> http://pastebin.com/esGFdC0n
 >> 
 >> Can you send a proper patch with this fix?

 Gustavo> How so?
 Gustavo> There's something fishy with this "bug".

 Gustavo> The tool renaming happened with dosfstools 3.0.18, hence
 Gustavo> 3.0.16 behaves the exact same way as before (mkdosfs instead
 Gustavo> of mkfs.fat and so on).  Either the 3.0.16 tarball he has
 Gustavo> isn't really 3.0.16 or i don't know what's up.  Daniel: did
 Gustavo> you try removing the source tarball and trying a new download?

Yes, indeed.

wget http://fossies.org/linux/misc/dosfstools-3.0.16.tar.gz
Saving to: `dosfstools-3.0.16.tar.gz'

wget http://daniel-baumann.ch/files/software/dosfstools/dosfstools-3.0.16.tar.gz
Saving to: `dosfstools-3.0.16.tar.gz.1'

md5sum dosfstools-3.0.16.tar.gz* ~download/dosfstools-3.0.16.tar.gz /tmp
7f1c1afd4ae4622e07b24ec0ddfc4184  dosfstools-3.0.16.tar.gz
ccedcd0458163fd8907c280459fc650c  dosfstools-3.0.16.tar.gz.1
ccedcd0458163fd8907c280459fc650c  /var/lib/downloads/dosfstools-3.0.{16,20}.tar.gz
7f1c1afd4ae4622e07b24ec0ddfc4184  /var/lib/downloads/dosfstools-3.0.20.tar.gz


2013.05 was using the old fossies.org location you fixed in June
(06938c3a9):

http://git.buildroot.net/buildroot/tree/package/dosfstools/dosfstools.mk?id=2013.05

The fossies.org location used to be correct:

ls -lah ~download/dosfstools-3.0.16.tar.gz
-rw-r--r-- 1 peko peko 85K Mar  1 09:02 /var/lib/downloads/dosfstools-3.0.16.tar.gz

But now seems to instead contain 3.0.20. Perhaps a buggy redirect?

Looking at the wget output, it indeed it the reason:

--2013-07-10 19:45:25--  http://fossies.org/linux/misc/dosfstools-3.0.16.tar.gz
Resolving fossies.org (fossies.org)... 85.25.235.31
Connecting to fossies.org (fossies.org)|85.25.235.31|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://fossies.org/linux/misc/dosfstools-3.0.20.tar.gz [following]
--2013-07-10 19:45:26--  http://fossies.org/linux/misc/dosfstools-3.0.20.tar.gz
Reusing existing connection to fossies.org:80.
HTTP request sent, awaiting response... 200 OK
Length: 96757 (94K) [application/x-gzip]
Saving to: `dosfstools-3.0.16.tar.gz'

100%[======================================>] 96,757      --.-K/s   in 0.1s

Perhaps we can get the fossies.org admins to fix it?

-- 
Bye, Peter Korsgaard
