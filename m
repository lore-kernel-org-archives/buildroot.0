From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Thu, 5 Sep 2013 12:28:07 +0200
Subject: [Buildroot] git http access broken ?
In-Reply-To: <52284FBA.5000400@lucaceresoli.net>
References: <CAHTvVMcwEyh-DA2BFfFqB5NdKyuZrqFsH_KOqaxxCgpyxXES_w@mail.gmail.com>
 <871u534o2m.fsf@dell.be.48ers.dk> <52284FBA.5000400@lucaceresoli.net>
Message-ID: <CAHTvVMd0MR_RX=R8q6motsMDp99mcjS-gW3+VecW1uJTZzKb=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/5 Luca Ceresoli <luca@lucaceresoli.net>:
> Peter Korsgaard wrote:
>>>>>>>
>>>>>>> "Nicolas" == Nicolas Aguirre <aguirre.nicolas@gmail.com> writes:
>>
>>   Nicolas> Hi,
>>   Nicolas> I'm using the git http protocol to update my buildroot tree as
>> i'm
>>   Nicolas> behind a proxy, with address found on your website :
>>   Nicolas> http://buildroot.uclibc.org/git.html
>>
>>   Nicolas> but since a few days, it seems broken when i try to update.
>>
>>   Nicolas> I do something wrong ?
>>
>> What exactly happens when you try? It works here:
>>
>> time git clone -v http://git.buildroot.net/git/buildroot.git
>> Cloning into 'buildroot'...
>> 5.96s user 2.16s system 5% cpu 2:35.53 total
>>
>> Notice that it is a lot slower than native git:// access:
>>
>> time git clone -v git://git.buildroot.net/buildroot
>> Cloning into 'buildroot'...
>> remote: Counting objects: 111019, done.
>> remote: Compressing objects: 100% (41701/41701), done.
>> remote: Total 111019 (delta 75790), reused 102807 (delta 68750)
>> Receiving objects: 100% (111019/111019), 31.63 MiB | 1.61 MiB/s, done.
>> Resolving deltas: 100% (75790/75790), done.
>> 3.03s user 0.83s system 9% cpu 41.150 total
>>
>
> It's working here as well, although it took 6 minutes.
>
> However, I sniffed the clone operation with wireshark and noticed many
> "404 Not Found" errors. I wonder if it is normal with http access.
>
> Luca
>

Indeed i tried a fresh clone and it works.

Previously i had this error :

git pull --rebase
error: Unable to find 78dea3be02ad154460c277afc4844ae68d7ecf60 under
http://git.buildroot.net/git/buildroot.git
Cannot obtain needed blob 78dea3be02ad154460c277afc4844ae68d7ecf60
while processing commit 5128cc6602d56a2c3af4cf6a0fe072d39d6c1aca.
error: Fetch failed.

I tried to do a fresh clone as you suggested :
git clone http://git.buildroot.net/git/buildroot.git buildroot2
#it's indeed really slow but it finished.
cd buildroot # the one that was not working
git pull --rebase /home/nico/src/buildroot2
git pull --rebase

And tada, it works again !

I don't see what was wrong in my first pull --rebase.
I should have missed someting with git ...
Sorry for the noise, and thanks for your help !

Regards
-- 
Nicolas Aguirre
Mail: aguirre.nicolas at gmail.com
Web: http://enna.geexbox.org
Blog: http://dev.enlightenment.fr/~captainigloo/
