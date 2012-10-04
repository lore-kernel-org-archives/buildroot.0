From: dboml <dboml@free.fr>
Date: Thu, 04 Oct 2012 22:32:09 +0200
Subject: [Buildroot] build an "autotooled" that is out of tree
In-Reply-To: <k2ur4l$djn$1@ger.gmane.org>
References: <50524954.2070101@free.fr> <k2ur4l$djn$1@ger.gmane.org>
Message-ID: <506DF249.4020306@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, thanks, it works.

With the project autooled, i do:
autoreconf --install

Put the buildroot compiler path (<buildroot path>/output/host/usr/bin/)

./configure --host=<compiler prefix>

Do i have have to change PATH before autoreconf ?

Thanks.
David.

Le 14/09/2012 10:50, Romain Izard a ?crit :
> On 2012-09-13, David Bonnin <dboml@free.fr> wrote:
>> Hello,
>>
>> We have a projet that out of the buildroot tree.
>> This projet is build with autotools.
>>
>> When we run .configure script of our projet, we need to set a lot of env
>> variable and pas os it to ./configure.
>>
> Put the buildroot compiler path (<buildroot path>/output/host/usr/bin/)
> in your PATH, and launch ./configure --host=<compiler prefix>. The compiler
> there is a wrapper to the real compiler, with additional default settings.
>
> This should take care of most problems.
>
