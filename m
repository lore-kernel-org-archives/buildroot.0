From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 22 May 2018 19:19:52 +0200
Subject: [Buildroot] [PATCH 1/1] libgit2: New package.
In-Reply-To: <20180520222731.6757154c@windsurf>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
 <20180214111351.4801-2-nicolas.cavallari@green-communications.fr>
 <20180520222731.6757154c@windsurf>
Message-ID: <6324c3b1-c745-7375-9535-0c46abb61974@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, and thanks.

On 20/05/2018 22:27, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 14 Feb 2018 12:13:51 +0100, Nicolas Cavallari wrote:
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> ---
>>   DEVELOPERS                   |  3 +++
>>   package/Config.in            |  1 +
>>   package/libgit2/Config.in    |  9 +++++++++
>>   package/libgit2/libgit2.hash |  3 +++
>>   package/libgit2/libgit2.mk   | 25 +++++++++++++++++++++++++
>>   5 files changed, 41 insertions(+)
>>   create mode 100644 package/libgit2/Config.in
>>   create mode 100644 package/libgit2/libgit2.hash
>>   create mode 100644 package/libgit2/libgit2.mk
> So, I've applied to next, but I had to change quite a few things that
> were not really correct:
>
>      [Thomas:
>       - Do not select BR2_PACKAGE_ZLIB, because zlib is an optional
>         dependency.
IIRC zlib is not really an optional dependency.? If zlib is not 
detected, then a bundled version of zlib is compiled in deps/zlib...

I don't think this is desirable, that's why i forced a dependency on zlib.
