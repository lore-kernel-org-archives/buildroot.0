From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 10 Aug 2015 15:14:24 +0200
Subject: [Buildroot] [PATCHv3 0/4] openpowerlink bump to v2.2
In-Reply-To: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
References: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <55C8A3B0.2060109@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 07/08/2015 15:28, Romain Naour a ?crit :
> From doc/openpowerlink.md:
> "The openPOWERLINK release V2.X is an evolution of the openPOWERLINK V1 stack.
> Running the kernel and user layers of openPOWERLINK on different processors in
> a multi-processor/multi-platform architecture, required fundamental changes in
> the Communication Abstraction Layer. Additionally, the existing code base was
> greatly improved so that it is easier to understand and maintain. Due to these
> reasons a new major release was started."
> 
> The openpowerlink2 package archive contains several cmake projects,
> and each of them must be packaged separately in Buildroot.
> 
> "With version 2.0, the source code has been cleanly split into an
> application-oriented user library and a time-critical stack driver."
> 
> This complicates the packaging but it helps to refine the dependencies
> compared to openpowerlink v1 build system.
> (openpowerlink v1 requires C++ only for the qt demo)
> 

You asked on IRC if it's possible to have only one openpowerlink package.
I would say yes, by adding a top-level CMakeLists.txt like this one [1] but
the build dependencies between each projects are not handled.
All is build at the same time.
This is a problem for demo applications which are looking for openpowerlink
libraries using FIND_OPLK_LIBRARY, but before it had time to be compiled.

I don't know how to add a dependency between the "stack" project and the "app"
project.

Otherwise, we need to package each sub projects in order to handle the
dependency outside of the CMake world...

Samuel, have you an idea ?

Best regards,
Romain

[1] https://sourceforge.net/u/kubu/code/ci/f80f43d02aabb0f2acc09d4ce420ecc3dcfad81c/
