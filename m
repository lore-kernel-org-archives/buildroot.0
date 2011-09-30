From: Luca Ceresoli <list@lucaceresoli.net>
Date: Fri, 30 Sep 2011 23:57:02 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <20110930195805.0677ff0b@skate>
References: <4E79E001.7010409@lucaceresoli.net> <20110930160415.69616a8d@skate>
 <CAAXf6LUvj5gJxmLa1gL1WssYJUs9fvWa30cAEBFpscQF_QXMoA@mail.gmail.com>
 <20110930195805.0677ff0b@skate>
Message-ID: <4E863B2E.7000602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:

>
>> Of course, explicit host packages will be treated the same way as
>> dependency-host-packages on Config.in level, but I don't think this is
>> a problem.
> Not sure what you mean here, but that raises the question of
> dependencies between host packages.
I'm also unsure about what Thomas (De Schampheleire) means here, but this
could be read as a feature as well.
A package such as omap-u-boot-utils can be required to build an OMAP-signed
image, thus being a dependency-host-package, or standalone to interact with
the target, thus being an explicit host package.
"Being treated in the same way" means it would work in both cases without
additional effort...


>>> All these Config.in.host
>>>    files are included in a single "Packages ->  Host utitities"
>>> submenu, from package/Config.in. There is no need to create
>>> subsections in this menu at the moment, since the number of
>>> utilities shown here is suspected to remain limited.
>> If you want to add the new menu under Packages, then the description
>> of that menu should change. Currently it is:
>> "Package Selection for the target"
>> A proposal is simply:
>> "Package selection"
>>
>> The alternative is as proposed earlier: to put the menu at top-level.
> No strong opinion here. Perhaps a new top-level menu is better, I don't
> know.

I personally feel a top-level menu would be better, leaving the "packages"
menu to list what has to be on the target.

Luca
