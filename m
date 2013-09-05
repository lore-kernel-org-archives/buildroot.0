From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Sep 2013 11:25:53 +0200
Subject: [Buildroot] git http access broken ?
In-Reply-To: <CAHTvVMcwEyh-DA2BFfFqB5NdKyuZrqFsH_KOqaxxCgpyxXES_w@mail.gmail.com>
 (Nicolas Aguirre's message of "Thu, 5 Sep 2013 10:14:42 +0200")
References: <CAHTvVMcwEyh-DA2BFfFqB5NdKyuZrqFsH_KOqaxxCgpyxXES_w@mail.gmail.com>
Message-ID: <871u534o2m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Aguirre <aguirre.nicolas@gmail.com> writes:

 Nicolas> Hi,
 Nicolas> I'm using the git http protocol to update my buildroot tree as i'm
 Nicolas> behind a proxy, with address found on your website :
 Nicolas> http://buildroot.uclibc.org/git.html

 Nicolas> but since a few days, it seems broken when i try to update.

 Nicolas> I do something wrong ?

What exactly happens when you try? It works here:

time git clone -v http://git.buildroot.net/git/buildroot.git
Cloning into 'buildroot'...
5.96s user 2.16s system 5% cpu 2:35.53 total

Notice that it is a lot slower than native git:// access:

time git clone -v git://git.buildroot.net/buildroot
Cloning into 'buildroot'...
remote: Counting objects: 111019, done.
remote: Compressing objects: 100% (41701/41701), done.
remote: Total 111019 (delta 75790), reused 102807 (delta 68750)
Receiving objects: 100% (111019/111019), 31.63 MiB | 1.61 MiB/s, done.
Resolving deltas: 100% (75790/75790), done.
3.03s user 0.83s system 9% cpu 41.150 total

-- 
Bye, Peter Korsgaard
