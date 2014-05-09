From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 May 2014 17:39:15 +0200
Subject: [Buildroot] [PATCH 3/7] graph-depends: handle the depth
 argument in a more pythonic way
In-Reply-To: <20140509152856.GG3173@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
 <c7673129299755f4b0d5f309796cd4bdb55226c2.1399647182.git.yann.morin.1998@free.fr>
 <CAHXCMMJSZsKT+jaE0VXoAzJvXmR8e6vEPR2tR988AqT7d5xXQg@mail.gmail.com>
 <20140509152856.GG3173@free.fr>
Message-ID: <CAHXCMMJnzbvvvfQGmP6bWEZx8vN3Y_u3aZ1WfVTiNcRgie_bUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 9, 2014 at 5:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[...]
>> > -parser.add_argument("--depth", '-d', metavar="DEPTH",
>> > -                    help="Limit the dependency graph to DEPTH levels")
>> > +parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
>> > +                    help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
>> > +parser.set_defaults(depth=0)
>>
>> You can also do:
>>
>> parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
>>     help="Limit the dependency graph to DEPTH levels; 0 means no limit.",
>>     type=int, default=0)
>
> Aha! Nice! Thank you. :-)
>
> Then I suppose that:    max_depth = int(args.depth)
> has to be just:         max_depth = args.depth
> Right?

yes :-)

(see, you start loving python ;-])


-- 
Samuel
