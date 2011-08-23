From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Tue, 23 Aug 2011 16:30:29 -0400
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <CAAa76NTwjrB-6jbenSbGDpN0evxnV-TVx36DvdNcvWnVQEfr4w@mail.gmail.com>
References: <CAAa76NTwjrB-6jbenSbGDpN0evxnV-TVx36DvdNcvWnVQEfr4w@mail.gmail.com>
Message-ID: <CAAa76NQpfMaN-EQ6pBx6y6V-yJ3QUk+w0sQrD=iktdJ=qgHKgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 13, 2011 at 9:31 AM, raymond zhao <raymond.zhao.ml@gmail.com> wrote:
>>> The linux kernel is a special "package". Lots of embedded projects
>
>>> (if not all of them) will start from a certain version of the kernel
>
>>> and hack the kernel from there, such as add device drivers etc. Then,
>
>>> put the source code into a local git server to do version control.
>
>>> Some people argued to use original tarball plus the patch, but it
>
>>> makes the development procedure very painful. In the old approach, it
>
>>> is very easy to hack the linux.mk to checkout the kernel source code
>
>>> directly into the output directory. But, in the new one. Looks it
>>
>>> becomes more complex. The kernel is very big. Check out with the git,
>>
>>> archive it to a tarball, and then extract it to the output directory
>>
>>> for building will waste lots of time. Is there a official solution
>>
>>> (or suggestion) for my situation?
>>
>>Yes, I am currently working on extending the package infrastructure so
>>
>>that any package (not only the Linux kernel, but any package) can be
>>
>>sourced from an existing directory, instead of being downloaded through
>>
>>git/svn/http.
>>
>>I have already published preliminary versions of this work (see "[RFC]
>>
>>Override source directories", posted May, 18th 2011), and I intend to
>>
>>continue. The basic mechanism is working, I still have issues
>>
>>implementing "make source" and "make external-deps" with this mechanism.
>>
>>It'd be really nice if you could have a look at what I did to see if it
>>
>>would solve your use case as well.
>
> That's great. I will definitely check it. If we solved this problem. I
> believe BR will be #1 choice for most embedded linux projects.
>
> thanks,
> raymond
>

BR 2011.08 rc was released and I did not see this feature in there? Is
it still going to happened in 2011.08 release?
Please add this feature if possible, it is really useful.
thanks,
raymond
