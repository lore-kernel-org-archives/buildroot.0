From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 11:09:03 +0200
Subject: [Buildroot] How to manually download a package?
In-Reply-To: <20130724090648.GA11352@zuhnb712.ap.bm.net>
References: <20130724084623.GA14235@zuhnb712.ap.bm.net>
 <CAAXf6LW6CQhx-z1VJcBfo-KQy+x6VxXpOXk55pMq+1YmVvmvcw@mail.gmail.com>
 <20130724090648.GA11352@zuhnb712.ap.bm.net>
Message-ID: <CAAXf6LUOB-tQK-10E38TWcgX+J2h3=Jof0CqyFYGu21Z9NF2WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 24, 2013 at 11:06 AM, Woody Wu <narkewoody@gmail.com> wrote:
> On Wed, Jul 24, 2013 at 10:54:32AM +0200, Thomas De Schampheleire wrote:
>> Hi,
>>
>> On Wed, Jul 24, 2013 at 10:46 AM, Woody Wu <narkewoody@gmail.com> wrote:
>> > Hi,
>> >
>> > I enabled vim, but the download site seems unreachable from my place.
>> > But I can find the vim-7.3 from other mirror sites.  Problem is, I am
>> > not sure how should I put my manually downloaded file and more
>> > important, what's the package tarball file name buildroot is expecting.
>> >
>> > Below are build error message when buildroot failed to download vim:
>> >
>> >>>> vim 699f8d8f096d Downloading
>> > abort: error: Network is unreachable
>> > --2013-07-24 16:20:53--
>> > http://sources.buildroot.net//vim-699f8d8f096d.tar.gz
>> >
>> > Does it mean that I just need to download the vim-7.3.tar.gz and rename
>> > it as vim-699f8xxxx.tar.gz before put it in the buildroot download
>> > directory?
>>
>> The vim package is directly downloading the sources from a mercurial repository.
>> This is basically 'hg clone <repo>' followed by 'hg archive -r
>> <revision> <tarball>'.
>> You could try this manually to check if you can do this in your network.
>
> okay, what the <repo> should be? Is that https://vim.googlecode.com/hg ?
> I found the url from vim.mk but not sure it is right.

Yes, that should be correct.
