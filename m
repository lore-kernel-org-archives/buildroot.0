From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 14 Dec 2011 08:59:35 +0100
Subject: [Buildroot] [RFC] Python packages
In-Reply-To: <20111214084639.2a76f2bc@skate>
References: <4EE85335.9060109@visionsystems.de> <20111214084639.2a76f2bc@skate>
Message-ID: <4EE85767.6090309@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.12.2011 08:46, schrieb Thomas Petazzoni:
> Hello,
>
> Le Wed, 14 Dec 2011 08:41:41 +0100,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> I just wanted to add some network related python packages (dpkt and
>> netifaces) to buildroot. At the moment we have only pyserial as
>> external python component,
> And python-mad, in package/multimedia/
>
>> residing in packages/python-serial. Should I pack these packages just
>> under Libraries->Networking or should I create special folder
>> packages/python-addons and put those packages there?
> Your question is strange because you're comparing a location in
> menuconfig ("Libraries->Networking") and a location in the source tree
> ("packages/python-addons") while the two are not related.

I know I just wanted to cover both topics at a time: location in packages and in configuration.

> From a source tree location perspective, Peter's wish is to keep
> everything directly under package/ as much as possible. So we would
> have there python/, python-serial/, python-something/,
> python-somethingelse/ and so forth. But I think they should all start
> with the python- prefix. This wasn't done with Lua extensions and I am
> personally not happy with this.

O.K. Than I'll add python- prefix.

> Now, for the location in menuconfig, I must say I don't know. Should we
> sort them by Language (Python extensions, Lua extensions) or by usage
> type (Network, Multimedia, etc.). So far, the extensions are listed "by
> usage", along with all other libraries for the same type of usage.

That's a good question. I see here 3 possibilities:

1. by usage
2. by language
3. both by usage and language

The latter makes more work but would be easier for users to find. IMHO

For Python we have "core components" section so we could add "external components" one and place usage hierarchy there or at first without usage hierarchy, till the number of packages will exceed the manageable count.

Yegor
