From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 9 Mar 2016 19:47:32 -0500
Subject: [Buildroot] [PATCH] erlang: disable for sparc
In-Reply-To: <20160307000529.3d7567e8@free-electrons.com>
References: <20151206151004.GA23217@waldemar-brodkorb.de>
 <20160307000529.3d7567e8@free-electrons.com>
Message-ID: <CA+-urNREfjSGDRcYML_BXRKweK+umP2SXfDTNs6cny1qFZfQgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Waldemar, all,

On Sun, Mar 6, 2016 at 6:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Waldemar,
>
> On Sun, 6 Dec 2015 16:10:04 +0100, Waldemar Brodkorb wrote:
>> Required atomic operations not available for sparc.
>> Fixes autobuild failures:
>> http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
>> http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
>>
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>>  package/erlang/Config.in |    2 ++
>>  1 file changed, 2 insertions(+)
>
> Now that we have proper options to describe atomic intrinsics
> dependencies, this patch is no longer the correct solution to solve
> this problem. Also, there are some patches from Frank pending around
> erlang, touching atomic support. However, I haven't checked if they
> fixed the sparc issue specifically.

No, the sparc issue isn't fixed in Erlang 18. Compilation fails with
'architecture mismatch on "cas" and "membar"' errors. Sparc_v9 works,
though. My Erlang patch series had included this. It strikes me, now,
that I probably should have broken the submitted patch into second
commit to address sparc. I'll address that next iteration since the
current submission already is greatly changed (simplified) and likely
due for more comments.

Regards,
Frank
