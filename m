From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Feb 2017 17:18:56 +0100
Subject: [Buildroot] [Patch v2 0/4] Add support for Cargo,
 the Rust package manager
In-Reply-To: <1468534054-14110-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468534054-14110-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <3db01a49-aec6-f231-051b-5f6e381b2a87@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-07-16 00:07, Eric Le Bihan wrote:
> This series adds support for Cargo, the Rust package manager by providing a
> package for the host variant.

 Hi Eric,

 Even though this series didn't receive any review, I've marked it as Changes
Requested in patchwork because it depends on the Rust stuff. When you resubmit,
could you combine both in a single series?

 Thanks,
 Arnout

> 
> v1 -> v2:
> 
>  - bump cargo to 0.11.0
>  - make host-libssh2 depends on host-openssl
> 
> Eric Le Bihan (4):
>   libssh2: add host variant
>   libhttpparser: add host variant
>   cargo-bootstrap: new package
>   cargo: new package
> 
>  package/cargo-bootstrap/cargo-bootstrap.hash |   3 +
>  package/cargo-bootstrap/cargo-bootstrap.mk   |  14 ++++
>  package/cargo/0001-Allow-use-of-wget.patch   |  56 ++++++++++++++
>  package/cargo/cargo.hash                     |   2 +
>  package/cargo/cargo.in                       |   2 +
>  package/cargo/cargo.mk                       | 106 +++++++++++++++++++++++++++
>  package/cargo/config.in                      |   2 +
>  package/libhttpparser/libhttpparser.mk       |   9 +++
>  package/libssh2/libssh2.mk                   |   6 ++
>  9 files changed, 200 insertions(+)
>  create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
>  create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk
>  create mode 100644 package/cargo/0001-Allow-use-of-wget.patch
>  create mode 100644 package/cargo/cargo.hash
>  create mode 100644 package/cargo/cargo.in
>  create mode 100644 package/cargo/cargo.mk
>  create mode 100644 package/cargo/config.in
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
